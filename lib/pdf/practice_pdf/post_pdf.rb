module PracticePdf
  class PostPdf < Prawn::Document
    def initialize(schedules) 
      super(page_size: 'A4',
            page_layout: :landscape
           )
      @schedules = schedules
      # stroke_axis # 座標を表示
      font 'app/assets/fonts/SourceHanSans-Regular.ttc'

      header
      body
    end

    def header
      text '【活動計画・報告】'
      bounding_box([650,510], width: 40, height: 15){
        stroke_bounds
        pad(2) {text'副社長', size: 10, align: :center}
      }
      bounding_box([690,510], width: 40, height: 15){
        stroke_bounds
        pad(2) {text'部長', size: 10, align: :center}
      }
      bounding_box([730,510], width: 40, height: 15){
        stroke_bounds
        pad(2) {text'担当', size: 10, align: :center}
      }
      bounding_box([650,495], width: 40, height: 35){
        stroke_bounds
      }
      bounding_box([690,495], width: 40, height: 35){
        stroke_bounds
      }
      bounding_box([730,495], width: 40, height: 35){
        stroke_bounds
      }
    end
    
    def body
      rows = [["訪問日","会社名","担当", "商談内容","目的","時間", "商品", "報告","その他","次回"]]

      bounding_box([0, 440], width: 770) do
        if @schedules.each do |f|
          row_data = [
            [
              f.visit_date.strftime("%m/%d"),
              f.client ? f.client : "",
              f.person ? f.person : "",
              f.content.name ? f.content.name : "",
              f.aim ? f.aim : "",
              (f.starting_time ? f.starting_time.strftime("%H:%M") : "") + "〜" + (f.ending_time ? f.ending_time.strftime("%H:%M")  : ""),
              f.product.name ? f.product.name : "",
              f.report ? f.report : "",
              f.other ? f.other : "",
              f.start_time ? f.start_time.strftime("%m/%d") : ""
            ]
          ]
          rows += row_data
          end.empty?
          text ""
        end
        table rows,cell_style: {}  do
          cells.size = 7
          cells.padding = 10, 5
          rows(0).align = :center
          columns(0).width = 30
          columns(1).width = 90
          columns(2).width = 60
          columns(3).width = 60
          columns(4).width = 125
          columns(5).width = 55
          columns(5).align = :center
          columns(6).width = 60
          columns(7).width = 130
          columns(8).width = 125
          columns(9).width = 30

        end
      end
    end
  end
end