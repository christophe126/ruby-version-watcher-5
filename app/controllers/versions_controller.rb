class VersionsController < ApplicationController
  def index
    @versions = Version.all
    @version_in_db = @versions.last
    # call service
    @check_version = ScrapVersion.new
    @compare_version = @check_version.check_new_version_ruby
  end

  def export_csv()
    @listes_versions = Version.all

    respond_to do |format|
      format.html
      format.csv { send_data @listes_versions.to_csv, filename: "version-#{Date.today}.csv" }
    end
  end
end
