#!/usr/bin/env ruby

# Esc[20h   Set new line mode   LMN
# Esc[?1h   Set cursor key to application   DECCKM
# none  Set ANSI (versus VT52)  DECANM
# Esc[?3h   Set number of columns to 132  DECCOLM
# Esc[?4h   Set smooth scrolling  DECSCLM
# Esc[?5h   Set reverse video on screen   DECSCNM
# Esc[?6h   Set origin to relative  DECOM
# Esc[?7h   Set auto-wrap mode  DECAWM
# Esc[?8h   Set auto-repeat mode  DECARM
# Esc[?9h   Set interlacing mode  DECINLM
#
# Esc[20l   Set line feed mode  LMN
# Esc[?1l   Set cursor key to cursor  DECCKM
# Esc[?2l   Set VT52 (versus ANSI)  DECANM
# Esc[?3l   Set number of columns to 80   DECCOLM
# Esc[?4l   Set jump scrolling  DECSCLM
# Esc[?5l   Set normal video on screen  DECSCNM
# Esc[?6l   Set origin to absolute  DECOM
# Esc[?7l   Reset auto-wrap mode  DECAWM
# Esc[?8l   Reset auto-repeat mode  DECARM
# Esc[?9l   Reset interlacing mode  DECINLM
#
# Esc=  Set alternate keypad mode   DECKPAM
# Esc>  Set numeric keypad mode   DECKPNM
#
# Esc(A   Set United Kingdom G0 character set   setukg0
# Esc)A   Set United Kingdom G1 character set   setukg1
# Esc(B   Set United States G0 character set  setusg0
# Esc)B   Set United States G1 character set  setusg1
# Esc(0   Set G0 special chars. & line set  setspecg0
# Esc)0   Set G1 special chars. & line set  setspecg1
# Esc(1   Set G0 alternate character ROM  setaltg0
# Esc)1   Set G1 alternate character ROM  setaltg1
# Esc(2   Set G0 alt char ROM and spec. graphics  setaltspecg0
# Esc)2   Set G1 alt char ROM and spec. graphics  setaltspecg1
#
# EscN  Set single shift 2  SS2
# EscO  Set single shift 3  SS3
#
# Esc[m   Turn off character attributes   SGR0
# Esc[0m  Turn off character attributes   SGR0
# Esc[1m  Turn bold mode on   SGR1
# Esc[2m  Turn low intensity mode on  SGR2
# Esc[4m  Turn underline mode on  SGR4
# Esc[5m  Turn blinking mode on   SGR5
# Esc[7m  Turn reverse video on   SGR7
# Esc[8m  Turn invisible text mode on   SGR8
#
# Esc[Line;Liner  Set top and bottom lines of a window  DECSTBM
#
# Esc[ValueA  Move cursor up n lines  CUU
# Esc[ValueB  Move cursor down n lines  CUD
# Esc[ValueC  Move cursor right n lines   CUF
# Esc[ValueD  Move cursor left n lines  CUB
# Esc[H   Move cursor to upper left corner  cursorhome
# Esc[;H  Move cursor to upper left corner  cursorhome
# Esc[Line;ColumnH  Move cursor to screen location v,h  CUP
# Esc[f   Move cursor to upper left corner  hvhome
# Esc[;f  Move cursor to upper left corner  hvhome
# Esc[Line;Columnf  Move cursor to screen location v,h  CUP
# EscD  Move/scroll window up one line  IND
# EscM  Move/scroll window down one line  RI
# EscE  Move to next line   NEL
# Esc7  Save cursor position and attributes   DECSC
# Esc8  Restore cursor position and attributes  DECSC
#
# EscH  Set a tab at the current column   HTS
# Esc[g   Clear a tab at the current column   TBC
# Esc[0g  Clear a tab at the current column   TBC
# Esc[3g  Clear all tabs  TBC
#
# Esc#3   Double-height letters, top half   DECDHL
# Esc#4   Double-height letters, bottom half  DECDHL
# Esc#5   Single width, single height letters   DECSWL
# Esc#6   Double width, single height letters   DECDWL
#
# Esc[K   Clear line from cursor right  EL0
# Esc[0K  Clear line from cursor right  EL0
# Esc[1K  Clear line from cursor left   EL1
# Esc[2K  Clear entire line   EL2
#
# Esc[J   Clear screen from cursor down   ED0
# Esc[0J  Clear screen from cursor down   ED0
# Esc[1J  Clear screen from cursor up   ED1
# Esc[2J  Clear entire screen   ED2
#
# Esc5n   Device status report  DSR
# Esc0n   Response: terminal is OK  DSR
# Esc3n   Response: terminal is not OK  DSR
#
# Esc6n   Get cursor position   DSR
# EscLine;ColumnR   Response: cursor is at v,h  CPR
#
# Esc[c   Identify what terminal type   DA
# Esc[0c  Identify what terminal type (another)   DA
# Esc[?1;Value0c  Response: terminal type code n  DA
#
# Escc  Reset terminal to initial state   RIS
#
# Esc#8   Screen alignment display  DECALN
# Esc[2;1y  Confidence power up test  DECTST
# Esc[2;2y  Confidence loopback test  DECTST
# Esc[2;9y  Repeat power up test  DECTST
# Esc[2;10y   Repeat loopback test  DECTST
#
# Esc[0q  Turn off all four leds  DECLL0
# Esc[1q  Turn on LED #1  DECLL1
# Esc[2q  Turn on LED #2  DECLL2
# Esc[3q  Turn on LED #3  DECLL3
# Esc[4q  Turn on LED #4  DECLL4

# Escape Sequence   Meaning
# \n  newline (0x0a)
# \s  space (0x20)
# \r  carriage return (0x0d)
# \t  tab (0x09)
# \v  vertical tab (0x0b)
# \f  formfeed (0x0c)
# \b  backspace (0x08)
# \a  bell/alert (0x07)
# \e  escape (0x1b)
# \nnn  character with octal value nnn
# \xnn  character with hexadecimal value nn
# \unnnn  Unicode code point U+nnnn (Ruby 1.9 and later)
# \cx   control-x
# \C-x  control-x
# \M-x  meta-x
# \M-\C-x   meta-control-x
# \x  character x itself (\" a single quote, for example)


 # The Color Code:     <ESC>[{attr};{fg};{bg}m

# I'll explain the escape sequence to produce colors. The sequence to be printed or echoed to the terminal is

  # <ESC>[{attr};{fg};{bg}m

# The first character is ESC which has to be printed by pressing CTRL+V and then ESC on the Linux console or in xterm, konsole, kvt, etc. ("CTRL+V ESC" is also the way to embed an escape character in a document in vim.) Then {attr}, {fg}, {bg} have to be replaced with the correct value to get the corresponding effect. attr is the attribute like blinking or underlined etc.. fg and bg are foreground and background colors respectively. You don't have to put braces around the number. Just writing the number will suffice.

# {attr} is one of following

  # 0 Reset All Attributes (return to normal mode)
  # 1 Bright (Usually turns on BOLD)
  # 2   Dim
  # 3 Underline
  # 5 Blink
  # 7   Reverse
  # 8 Hidden

# {fg} is one of the following

  # 30  Black
  # 31  Red
  # 32  Green
  # 33  Yellow
  # 34  Blue
  # 35  Magenta
  # 36  Cyan
  # 37  White

# {bg} is one of the following

  # 40  Black
  # 41  Red
  # 42  Green
  # 43  Yellow
  # 44  Blue
  # 45  Magenta
  # 46  Cyan
  # 47  White

# So to get a blinking line with Blue foreground and Green background, the combination to be used should be


# echo "^[[5;34;42mIn color"

# which actually is very ugly. :-) Revert back with

# echo "^[0;37;40m"

#256 colors
#Set the foreground color to index N:   \033[38;5;${N}m
#Set the background color to index M:   \033[48;5;${M}m

require 'rubygems'
require 'cls'
#require 'debugger'
require 'readline'
require 'pry'
require 'timeout'

# Add the lib dir to the ruby library search path
#$: << File.expand_path(File.dirname(File.realpath(__FILE__))+ '/../lib')
#require 'request_tracker_base'
#require 'request_tracker_ticket'

Signal.trap("INT") do
  exit
end

def output(string)
  STDOUT.write string.to_s
end

def clear_screen
  output "\e[2J"
end

def move_cursor(row, column)
  output "\e[#{row};#{column}H"
end

def screen_size
  cols = `tput cols`.chomp
  rows = `tput lines`.chomp
  [cols, rows]
end

def screen_size_using_escapes
  state = `stty -g`
  `stty raw -echo -icanon isig`
  STDOUT.write "\e[18t"
  response = c = ""
  while c != 't'
    c = STDIN.getbyte.chr #if STDIN.ready?
    response += c.to_s unless c == "\e"
  end
  if response =~ /\[8;(.*);(.*)t/
    rows = $1
    cols = $2
    return [cols, rows]
  end
  return []
ensure
  `stty #{state}`
end

def get_char
  state = `stty -g`
  `stty raw -echo -icanon isig`
  STDIN.getc.chr
ensure
  `stty #{state}`
end

require 'io/wait'
def char_if_pressed
   begin
     system("stty raw -echo") # turn raw input on
     c = nil
     c = $stdin.getc if $stdin.ready?
     c.chr if c
   ensure
     system "stty -raw echo" # turn raw input off
   end
end

def foreground_color(index)
  "\e[38;5;#{index}m"
end

def background_color(index)
  "\e[48;5;#{index}m"
end

def clear_formatting
  "\e[m"
end

def bounce
  clear_screen

  (max_y, max_x) = screen_size

  max_y = max_y.to_i
  max_x = max_x.to_i


  display_char = 'O'
  max_tail = 30
  x = 45
  y = 5
  x_direction = 1
  y_direction = 1
  color = 20
  tail = Array.new


  sleep_time = 0.09

  counter = 0


  debug = nil

  move_cursor(1,1)
  output x.to_s + ' ' + y.to_s  + ' vs ' + max_x.to_s + ' ' + max_y.to_s + ' ' + x_direction.to_s + ' Color: ' + color.to_s +  ' 1 to 9 for sleep length.  anything else changes display.  Try typing sentences parsed with cr vs space    '

  while true do
    output background_color(0)

    char = char_if_pressed

    if char then
      if (1..9).include?(char.to_i) then
        sleep_time = char.to_f / 100
      else
        display_char = char
      end
    end
    
    counter = counter + 1

    if counter % 40 == 0 then
      (temp_y, temp_x) = screen_size

      if ( temp_y != max_y or temp_x != max_x )
        clear_screen
        max_y = max_y.to_i
        max_x = max_x.to_i
      end
    end

    if x >= max_x then
      x = max_x
      x_direction = -1
    end

    if y >= max_y then
      y = max_y
      y_direction = -1
    end

    if x == 1 then
      x_direction = 1
    end

    if y == 1 then
      y_direction = 1
    end
    
    x = x + x_direction
    y = y + y_direction
    
    move_cursor(x,y)
    color = color + 1
    if color > 220 then
      color = 20
    end

    segment = Hash.new
    segment['x'] = x
    segment['y'] = y
    segment['color'] = color
    segment['display_char'] = display_char

    tail.unshift( segment )

    if tail.length > max_tail then
      end_segment = tail.pop
      move_cursor( end_segment['x'], end_segment['y'] )
      output ' '
    end

    tail.each do |segment|
      move_cursor( segment['x'], segment['y'])
      output foreground_color( segment['color'] )
      output segment['display_char']
    end
    output background_color( segment['color'])
    move_cursor(1,1)

    sleep sleep_time

  end
end

class Player
  def initialize( player_name )
    @@color ||= 10

    @@color = @@color + 10

    @player_name = player_name
    @display_char = 'O'
    @max_tail = 30
    @color = @@color
    @tail = Array.new

    (max_y, max_x) = screen_size

    @max_y = max_y.to_i
    @max_x = max_x.to_i

    @x = rand(@max_x)
    @y = rand(@max_y)
    @x_direction = rand(1)-1
    @y_direction = rand(1)-1

    @auto_play = true
  end

  def direction_up
    @x_direction = 0
    @y_direction = 1
  end

  def direction_down
    @x_direction = 0
    @y_direction = -1
  end

  def direction_left
    @x_direction = -1
    @y_direction = 0
  end

  def direction_right
    @x_direction = 1
    @y_direction = 0
  end


  def dead!
    print "Player " + @player_name + " died"
    abort
  end

  def move!    
    @x = @x + @x_direction
    @y = @y + @y_direction

    segment = Hash.new
    segment['x'] = @x
    segment['y'] = @y
    segment['color'] = @color
    segment['display_char'] = @display_char

    @tail.unshift( segment )

    if @tail.length > @max_tail then
      eat_segment
    end

  end

  def eat_segment
    end_segment = @tail.pop
    move_cursor( end_segment['x'], end_segment['y'] )
    output ' '
  end

  def dead?
    if @x >= @max_x then
      if @auto_play
        self.direction_down
      else
        self.dead!
      end
    end

    if @y >= @max_y then
      if @auto_play
        self.direction_left
      else
        self.dead!
      end
    end

    if @x == 1 then
      if @auto_play
        self.direction_up
      else
        self.dead!
      end
    end

    if @y == 1 then
      if @auto_play
        self.direction_right
      else
        self.dead!
      end
    end
  end

  def take_turn
    move!

    dead?

    draw_tail

    move_cursor(1,1)
  end

  def draw_tail
    @tail.each do |segment|
      move_cursor( segment['x'], segment['y'])
      output foreground_color( segment['color'] )
      output segment['display_char']
    end
  end
end

class Display
  def initialize
    clear_screen

    (max_y, max_x) = screen_size

    @max_y = max_y.to_i
    @max_x = max_x.to_i
  end
end

class Snafu
  def initialize
    @player = []
    @player.unshift( Player.new( "Player1") )
    @player.unshift( Player.new( "Player2" ) )

    @display = Display.new

    @sleep_time = 0.02

    @counter = 0

    (max_y, max_x) = screen_size

    @max_y = max_y.to_i
    @max_x = max_x.to_i
  end

  def turn
    output background_color(0)

    char = char_if_pressed

    if char then
      if (1..9).include?(char.to_i) then
        @sleep_time = char.to_f / 100
      else
        @display_char = char
      end
    end
    
    @counter = @counter + 1

    if @counter % 40 == 0 then
      (temp_y, temp_x) = screen_size

      if ( temp_y != @max_y or temp_x != @max_x )
        clear_screen
        @max_y = temp_y.to_i
        @max_x = temp_x.to_i
      end
    end

    @player.each do | player |
      player.take_turn
    end

    sleep @sleep_time

    if ( @counter > 500 )
      return false
    end
    return true
  end
end

snafu = Snafu.new

while snafu.turn

end

print "NOBODY DIED. BORING"

#bounce
