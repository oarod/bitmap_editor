class BitmapEditor

  WHITE = 'O'

  attr_reader :bitmap

  def run
    @running = true
    puts 'type ? for help'
    while @running
      print '> '
      input = gets.chomp
      command, *args = input.split
      case command
        when '?'
          show_help
        when 'I'
          create_bitmap args
        when 'S'
          show_bitmap
        when 'L'
          color_pixel args
        when 'H'
          color_horizontal args
        when 'C'
          clear_bitmap
        when 'X'
          exit_console
        else
          puts 'Unrecognised command.'
      end
    end
  end

  def create_bitmap(args)
    if !args.join(' ').match(/(\d+)\s(\d+)/)
      puts 'Incorrect arguments.'
    else
      @bitmap = Array.new(args[1].to_i) { Array.new(args[0].to_i, WHITE) }
    end
  end

  def show_bitmap
    if bitmap.nil?
      puts 'No bitmap available.'
    else
      puts bitmap.inject('') { |result, row| result << row.join << "\n" }
    end
  end

  def color_pixel(args)
    if !args.join(' ').match(/(\d+)\s(\d+)\s([A-Z])/)
      puts 'Incorrect arguments.'
    elsif bitmap.nil?
      puts 'No bitmap available.'
    elsif !args[0].to_i.between?(1, @bitmap[0].size) || !args[1].to_i.between?(1, @bitmap.size)
      puts 'Incorrect coordinates.'
    else
      bitmap[args[1].to_i - 1][args[0].to_i - 1] = args[2]
    end
  end

  def clear_bitmap
    if bitmap.nil?
      puts 'No bitmap available.'
    else
      @bitmap = Array.new(@bitmap.size) { Array.new(@bitmap[0].size, WHITE) }
    end
  end

  def color_horizontal args
    if !args.join(' ').match(/(\d+)\s(\d+)\s(\d+)\s([A-Z])/)
      puts 'Incorrect arguments.'
    elsif bitmap.nil?
      puts 'No bitmap available.'
    elsif !args[0].to_i.between?(1, @bitmap[0].size) || !args[1].to_i.between?(1, @bitmap[0].size) || !args[2].to_i.between?(1, @bitmap.size)
      puts 'Incorrect coordinates.'
    elsif args[0] > args[1]
      puts 'Incorrect X range'
    else
      x1 = args[0].to_i - 1
      x2 = args[1].to_i - 1
      y = args[2].to_i - 1
      c = args[3]
      (x1..x2).each { |x| bitmap[y][x] = c }
    end
  end

  private

    def exit_console
      puts 'goodbye!'
      @running = false
    end

    def show_help
      puts "? - Help
I M N - Create a new M x N image with all pixels coloured white (O).
C - Clears the table, setting all pixels to white (O).
L X Y C - Colours the pixel (X,Y) with colour C.
V X Y1 Y2 C - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
H X1 X2 Y C - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
S - Show the contents of the current image
X - Terminate the session"
    end
end
