module PracticePdf
  class PostPdf < Prawn::Document
    def initialize(schedules) 
      super(page_size: 'A4',
            page_layout: :landscape )
      @schedules = schedules
      stroke_axis # 座標を表示
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
      rows = [["訪問日","会社名","担当", "商談内容","目的","時間", "商品", "報告","次回"]]

      bounding_box([200, 450], width: 500) do
        if @schedules.each do |f|
          row_data = [
            [
              f.visit_date.strftime("%Y/%m/%d"),
              f.client ? f.client : "",
              f.person ? f.person: "",
              f.content.name ? f.content.name : "",
              f.aim ? f.aim : "",
              (f.starting_time ? f.starting_time.strftime("%H:%M:%S") : "-") + "〜" + (f.ending_time ? f.ending_time.strftime("%H:%M:%S")  : "-"),
              f.product.name ? f.product.name : "",
              f.report ? f.report : "",
              f.visit_date.strftime("%Y/%m/%d")
            ]
          ]
          rows = rows + row_data
        end.empty?
          text ""
        end
        Rails.logger.info(rows)
        table rows
      end
    end
  end
end
