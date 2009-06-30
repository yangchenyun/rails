module Rails
  module Generators
    class ScaffoldControllerGenerator < NamedBase
      include ControllerNamedBase

      check_class_collision :suffix => "Controller"
      class_option :singleton, :type => :boolean, :desc => "Supply to create a singleton controller"

      def create_controller_files
        template 'controller.rb', File.join('app/controllers', class_path, "#{file_name}_controller.rb")
      end

      hook_for :template_engine, :test_framework, :as => :scaffold
      invoke_if :helper
    end
  end
end
