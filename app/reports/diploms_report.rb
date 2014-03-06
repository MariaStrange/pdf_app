# encoding: utf-8
class DiplomsReport < Prawn::Document
  # ширина колонок
  Widths = [200, 200, 120]
  # заглавия колонок
  Headers = ['Дата добавления', 'Выпускник', 'Группа']
  
  def row(date, diplom_name, amount)
    row = [date, diplom_name, amount]
    make_table([row]) do |t|
      t.column_widths = Widths
      t.cells.style :borders => [:left, :right], :padding => 2
    end
  end
    
  def to_pdf
    # привязываем шрифты
    font_families.update(
      "Verdana" => {
        :bold => "/home/marusya/prawn_fonts/verdanab.ttf",
        :italic => "/home/marusya/prawn_fonts/verdanai.ttf",
        :normal => "/home/marusya/prawn_fonts/verdana.ttf" })
    font "Verdana", :size => 10
    text "Отчет за #{Time.zone.now.strftime('%b %Y')}", :size => 15, :style => :bold, :align => :center
    move_down(18)
    # выборка записей
    @diploms = Diplom.order('created_at')
    data = []
    items = @diploms.each do |item|
      data << row(item.created_at.strftime('%d/%m/%y %H:%M'), item.name, item.amount)
    end
    
    head = make_table([Headers], :column_widths => Widths)
    table([[head], *(data.map{|d| [d]})], :header => true, :row_colors => %w[cccccc ffffff]) do
      row(0).style :background_color => '000000', :text_color => 'ffffff'
      cells.style :borders => []
    end
    
    creation_date = Time.zone.now.strftime("Отчет сгенерирован %e %b %Y в %H:%M")
    go_to_page(page_count)
    move_down(710)
    text creation_date, :align => :right, :style => :italic, :size => 9
    render
  end
  
end
