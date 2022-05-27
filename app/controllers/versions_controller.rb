class VersionsController < ApplicationController
  def index
    @versions = Version.all.order("date_version DESC")
    #@version_in_db = @versions.last
  end

  def export_csv()
    @listes_versions = Version.all
    respond_to do |format|
      format.html
      format.csv { send_data @listes_versions.to_csv, filename: "version-#{Date.today}.csv" }
    end
  end
end
