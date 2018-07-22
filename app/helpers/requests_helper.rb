module RequestsHelper
  def status_request status
    done = "<i class='text-success'>#{(t "requests.done")}</i>"
    in_progess = "<i class='text-danger'>#{(t "requests.in_progess")}</i>"
    text_status = status == Settings.progress ? in_progess : done
  end
end
