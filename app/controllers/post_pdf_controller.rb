class PostPdfController < ApplicationController
  def index
    @p = Schedule.ransack(params[:q])
    @schedules = @p.result.includes(:user).order("visit_date ASC")
    respond_to do |format|
      format.pdf do
        post_pdf = PracticePdf::PostPdf.new(@schedules).render

        send_data post_pdf,
          filename: 'post_pdf.pdf',
          type: 'application/pdf',
          disposition: 'inline' # 外すとダウンロード
        end
      end
    end
end
