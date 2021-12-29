class MasterMind
    def initialize(color = "red white blue yellow")
        color = color.split(" ")
        @color = color.map{|ele| ele.downcase}
        @count = 1
        @correct_count = 0
        @near_misses = 0
    end

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


    def playing
        length
        until (@count >=13 || @correct_count >= @length)
            puts "This is the #{@count} turn"
            userInput
            puts "your inputs #{@input}"
            check
            puts "You've had #{@correct_count} correct guesses"
            puts "You've had #{@near_misses / 4} near misses"
        end
        if @count >= 13
            puts "You lost, Try again!"
        else
            puts "You've Won!, Human feel proud of yourself!"
        end
    end


    
    
end


master = MasterMind.new

master.playing