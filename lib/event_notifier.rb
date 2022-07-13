# frozen_string_literal: true

module EventNotifier
  extend ActiveSupport::Concern

  included do
    after_save :notify_event
    after_destroy :notify_event

    def notify_event
      self.class.connection.execute "NOTIFY #{self.class.table_name}, 'SSE'"
    end

    def self.on_event
      connection.execute "LISTEN #{table_name}"
      loop do
        break if Rails.env.test?

        connection.raw_connection.wait_for_notify do |_event, _pid, data|
          yield data
        end
        sleep 5
      end
    ensure
      connection.execute "UNLISTEN #{table_name}"
    end
  end
end
