class MasterMind
    def initialize(color = "red orange yellow green cyan blue magenta purple white black grey silver pink maroon brown beige indigo violet",word_count = 4)
        color = color.split(" ")
        color = color.sample(word_count)
        color = color.shuffle
        @color = color.map{|ele| ele.downcase}
        @count = 1
        @correct_count = 0
        @near_misses = 0
    end

    
    def playing
        length
        puts "#{@color}"
        until (@count >=13 || @correct_count >= @length)
            puts "This is the #{@count} turn"
            userInput
            puts "your inputs #{@input}"
            check
            puts "You've had #{@correct_count} correct guesses"
            puts "You've had #{@near_misses / @length} near misses"
        end
        if @count >= 13
            puts "You lost, Try again! , Stupid Human!"
        else
            puts "You've Won!, Human feel proud of yourself!"
        end
    end

    private

    def length
        @length = @color.length
        puts "There are #{@length} colors to guess chop chop!"
    end



    def userInput
        puts "Give me your input about the colors"
        sleep 0.3
        puts "Use spaces to put them apart"
        input = gets.chomp
        @input = input.split(" ")
        until @input.length == @length
            puts "You entered a invalid number of Pegs , Chop Chop"
            input = gets.chomp
            @input = input.split(" ")
        end
        @input.map! {|ele| ele.downcase}
    end

    def check
        @correct_count = 0
        @near_misses = 0
        (0...@length).each do |i|
            if @color[i] == @input[i]

                @correct_count+=1
            elsif
                @input.each {|ele| @near_misses+=1 if @color.include?(ele)}
            end
        end
        @count+=1
    end



    
    
end

def starting
    puts "Tell me which colors you want to play with seperate"
    puts "Seperate them with spaces"
    puts "Incase You don't want to have a customized experience just type yes"
    colors = gets.chomp
    colors.downcase!
    index_value = colors.split(" ")
    puts "Tell me how many colors do you want to play with"
    puts "Incase You don't want to tell me , just type 0"
    colors_val = gets.chomp.to_i
    until colors_val <= index_value.length || colors == "yes"
        puts "Invalid Value , Idiot! It can't be less than what you have to play with"
        puts "I have to ask you again puff!"
        puts "Tell me how many colors do you want to play with"
        puts "Incase You don't want to tell me , just type 0"
        colors_val = gets.chomp.to_i
    end

    if colors == "yes" && colors_val == 0
       master = MasterMind.new
    elsif colors == "yes" && colors_val > 0
       master = MasterMind.new(false,colors_val)
    elsif colors != "yes" && colors_val == 0
      master = MasterMind.new(colors)
    else
       master = MasterMind.new(colors,colors_val)
    end
    master.playing
end



starting
