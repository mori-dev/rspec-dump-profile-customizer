module RSpecDumpProfileCustomizer

  begin
    require 'rails/engine'
    require 'rspec/core/formatters/base_formatter'
    require 'rspec/core/formatters/documentation_formatter'

    class Railtie < ::Rails::Railtie

      config.rspec_dump_profile = ActiveSupport::OrderedOptions.new

      config.after_initialize do
        RSpec::Core::Formatters::BaseTextFormatter.class_exec(config.rspec_dump_profile.number, config.rspec_dump_profile.second) do |number, second|

          define_method("dump_profile") do
            if number
              sorted_examples_for_number = examples.sort_by {|example| example.execution_result[:run_time] }.
                reverse.first(number)
              total, slows = [examples, sorted_examples_for_number].map {|exs|
                exs.inject(0.0) {|i, e| i + e.execution_result[:run_time] }}
              time_taken = slows / total
              percentage = '%.1f' % ((time_taken.nan? ? 0.0 : time_taken) * 100)
              output.puts cyan("\nTop #{sorted_examples_for_number.size} slowest examples (#{format_seconds(slows)} seconds, #{percentage}% of total time):\n")
              sorted_examples_for_number.each do |example|
                output.puts "  #{example.full_description}"
                output.puts "    #{yellow(format_seconds(example.execution_result[:run_time]))} #{yellow("seconds")} #{format_caller(example.location)}"
              end
            end
            if second
              output.puts cyan("\nSlow examples (over #{second} seconds):\n")
              sorted_examples_for_number = examples.sort_by { |example| example.execution_result[:run_time] }.
                reverse.select { |example| example.execution_result[:run_time] > second.to_f }
              sorted_examples_for_number.each do |example|
                output.puts "  #{example.full_description}"
                output.puts "    #{yellow(format_seconds(example.execution_result[:run_time]))} #{yellow("seconds")} #{format_caller(example.location)}"
              end
            end
          end
        end
      end
    end
  rescue LoadError
  end
end
