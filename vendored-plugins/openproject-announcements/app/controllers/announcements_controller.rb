class AnnouncementsController < ApplicationController
  layout 'admin'

  before_filter :require_admin

  def edit
    @announcement = Announcement.only_one
  end

  def update
    @announcement = Announcement.only_one
    @announcement.attributes = announcement_params

    if @announcement.save
      flash[:notice] = l(:notice_successful_update)
    end

    render :action => 'edit'
  end

  private

  def default_breadcrumb
    l('announcements.announcement')
  end

  def announcement_params
    params.require(:announcement).permit('text', 'show_until', 'active')
  end
end
