# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe MembersController, type: :controller do
    it { should route(:get, '/account/members').to(action: :index) }
  end
end
