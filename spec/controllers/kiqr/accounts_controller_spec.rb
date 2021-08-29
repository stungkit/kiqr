# frozen_string_literal: true

require 'spec_helper'

module Kiqr
  RSpec.describe AccountsController, type: :controller do
    pending 'should redirect /account to /account/edit'

    it { should route(:get, '/account/new').to(action: :new) }
    it { should route(:get, '/account/setup').to(action: :setup) }
    it { should route(:get, '/account/edit').to(action: :edit) }
    it { should route(:post, '/account').to(action: :create) }
    it { should route(:patch, '/account').to(action: :update) }
    it { should route(:get, '/account/switch/1').to(action: :switch, id: 1) }
    it { should route(:patch, '/account/switch/1').to(action: :switch, id: 1) }
  end
end
