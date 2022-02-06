class SubmitPostJob < ApplicationJob
  queue_as :default

  def perform(post_id, post_updated_at)
    # Simulates a long, time-consuming task
    sleep 5
    # Will display current time, milliseconds included
    p "hello from HelloWorldJob #{Time.now().strftime('%F - %H:%M:%S.%L')}"
  end
end
