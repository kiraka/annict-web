# frozen_string_literal: true

module Canary
  module Types
    module Objects
      class ActivityGroupType < Canary::Types::Objects::Base
        implements GraphQL::Relay::Node.interface

        global_id_field :id

        field :annict_id, Integer, null: false
        field :resource_type, Canary::Types::Enums::ActivityType, null: false
        field :single, Boolean, null: false
        field :activities_count, Integer, null: false
        field :created_at, Canary::Types::Scalars::DateTime, null: false
        field :user, Canary::Types::Objects::UserType, null: false
        field :activities, Canary::Types::Objects::ActivityType.connection_type, null: false

        def resource_type
          object.resource_type.upcase
        end

        def user
          RecordLoader.for(User).load(object.user_id)
        end

        def activities
          Canary::AssociationLoader.for(ActivityGroup, %i(ordered_activities)).load(object)
        end
      end
    end
  end
end
