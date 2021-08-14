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
      bounding_box([0,450], width: 50, height: 15){
        stroke_bounds
        pad(2) {text'訪問日', size: 7, align: :center}
      }
      bounding_box([50,450], width: 120, height: 15){
        stroke_bounds
        pad(2) {text'会社名', size: 7, align: :center}
      }
      bounding_box([170,450], width: 50, height: 15){
        stroke_bounds
        pad(2) {text'担当', size: 7, align: :center}
      }
      bounding_box([220,450], width: 50, height: 15){
        stroke_bounds
        pad(2) {text'商談内容', size: 7, align: :center}
      }
      bounding_box([270,450], width: 100, height: 15){
        stroke_bounds
        pad(2) {text'目的', size: 7, align: :center}
      }
      bounding_box([370,450], width: 60, height: 15){
        stroke_bounds
        pad(2) {text'時間', size: 7, align: :center}
      }
      bounding_box([430,450], width: 60, height: 15){
        stroke_bounds
        pad(2) {text'商品', size: 7, align: :center}
      }
      bounding_box([490,450], width: 115, height: 15){
        stroke_bounds
        pad(2) {text'報告', size: 7, align: :center}
      }
      bounding_box([605,450], width: 115, height: 15){
        stroke_bounds
        pad(2) {text'報告', size: 7, align: :center}
      }
      bounding_box([720,450], width: 50, height: 15){
        stroke_bounds
        pad(2) {text'次回', size: 7, align: :center}
      }



      
      bounding_box([0, 430], width: 50, heigh:10 ) do
        # @schedules.each {|f| text f.visit_date, size:10} エラーが発生
      end

      bounding_box([50, 430], width: 200, heigh:10 ) do
        @schedules.each {|f| text f.client, size:7}
      end

      bounding_box([170, 430], width: 200, heigh:10) do  
       @schedules.each do |f|
        if f.person.present?    
         text f.person,size:7
        else
          text " ",size:7 
        end
       end
      end
    end

  end
end