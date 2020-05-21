# frozen_string_literal: true

require_relative 'base'

module Engine
  module Part
    class Junction < Base
      def initialize
        init_paths
      end

      def junction?
        true
      end
    end
  end
end
