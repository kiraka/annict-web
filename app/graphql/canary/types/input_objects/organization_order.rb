# typed: false
# frozen_string_literal: true

module Canary
  module Types
    module InputObjects
      class OrganizationOrder < Canary::Types::InputObjects::Base
        argument :field, Canary::Types::Enums::OrganizationOrderField, required: true
        argument :direction, Canary::Types::Enums::OrderDirection, required: true
      end
    end
  end
end
