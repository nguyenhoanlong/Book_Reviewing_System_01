module RequestsHelper
  def status_request status
    style = case status
      when Settings.approved
        "success"
      when Settings.pending
        "info"
      when Settings.rejected
        "danger"
    end

    return "<i class='text-#{style}'>#{status}</i>"
  end
end
