class StarshipsController < InheritedResources::Base
  before_filter :require_user
  actions :update

  def update
    update! do |format|
      format.html { redirect_to(:back) }
    end
  end
end
