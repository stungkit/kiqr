# frozen_string_literal: true

class KiqrController < Kiqr.config.parent_controller.constantize
  before_action :authenticate_user!
  respond_to :html

  # Sets the flash message with :key, using I18n. By default you are able
  # to set up your messages using specific resource scope, and if no message is
  # found we look to the default scope. Set the "now" options key to a true
  # value to populate the flash.now hash in lieu of the default flash hash (so
  # the flash message will be available to the current action instead of the
  # next action).
  def set_flash_message(key, kind, options = {})
    return unless flashing_format?

    message = find_message(kind, options)
    return if message.blank?

    if options[:now]
      flash.now[key] = message
    else
      flash[key] = message
    end
  end

  # Get message for given
  def find_message(kind, options = {})
    options[:scope] ||= translation_scope
    I18n.t(kind, **options)
  end

  # Default translation scope for messages
  def translation_scope
    "kiqr.#{controller_name}"
  end
end
