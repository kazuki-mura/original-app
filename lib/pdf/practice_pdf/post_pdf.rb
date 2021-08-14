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
      bounding_box([10, 450], width: 200, heigh:10 ) do
        @schedules.each {|f| text f.client, size:10}
      end

      bounding_box([200, 450], width: 200, heigh:10) do  
       @schedules.each do |f|
        if f.person.present?    
         text f.person,size:10 
        else
          text " ",size:10 
        end
       end
      end
    end

  end
end