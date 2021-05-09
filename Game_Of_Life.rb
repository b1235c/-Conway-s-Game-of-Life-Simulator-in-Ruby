require "timeout"

size = 20                       # grid size variable
gen = 1                         
grid = [];                      # create base grid with *s in it
(0..size).each do |row|
    grid[row] = []
    (0..size).each do |column|
        grid[row][column] = "* "
    end
end

grid[3][13] = "0 "               # identify base living cells - Blinker
grid[3][14] = "0 "
grid[3][15] = "0 "

grid[0][2] = "0 "                # identify base living cells - Glider
grid[1][2] = "0 "
grid[2][2] = "0 "
grid[2][1] = "0 "
grid[1][0] = "0 "

grid[17][3] = "0 "                # identify base living cells - The Toad
grid[17][4] = "0 "
grid[17][5] = "0 "
grid[18][2] = "0 "
grid[18][3] = "0 "
grid[18][4] = "0 "


system("cls")
puts "Welcome To".center size * 2
puts "----- CONWAY'S GAME OF LIFE SIMULATOR -----"                 # intro and instructions for user
# system("say Welcome to Conways Game of Life Simulator")
puts
puts "Press 'enter' to begin.".center size * 2
puts
gets.chomp

looping = true                                      # define loop variable

while looping
    system("cls")                                   # clear system screen each round so there aren't multiple grids
    puts                                            # line breaks for UX
    puts
   
    (0..size).each do |row|                          # print grid
        (0..size).each do |column|
            print grid[row][column]
        end
        puts
    end

    puts "----- GENERATION #{gen} -----".center size * 2
    
    dead_cells = [];                                 # create base integer grid that will count dead cells' neighbors - this resets to counter to 0 each loop
    (0..size).each do |row|
        dead_cells[row] = []
        (0..size).each do |column|    

            dead_cells[row][column] = 0
        end
    end

    (0..size).each do |row|                            # adding values to dead_cells array based on number of neighbors                        
        (0..size).each do |column|
            if grid[row][column] == "* "
                if row < size                          
                    if grid[row + 1][column] == "0 "    # checking bottom
                        dead_cells[row][column] += 1
                    end
                end
                if row > 0
                    if grid[row - 1][column] == "0 "     # checking top
                        dead_cells[row][column] += 1
                    end
                end
                if column < size                           # checking right
                    if grid[row][column + 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
                if column > 0                            # checking left
                    if grid[row][column - 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
                if column > 0 && row > 0                 # checking top left
                    if grid[row - 1][column - 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
                if column < size && row < size               # checking bottom right
                    if grid[row + 1][column + 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
                if column < size && row > 0                # checking top right
                    if grid[row - 1][column + 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
                if column > 0 && row < size                # checking bottom left
                    if grid[row + 1][column - 1] == "0 " 
                        dead_cells[row][column] += 1
                    end
                end
            end
        end
    end
    
    live_cells = [];                             # create base integer grid that will count live cells' neighbors - this resets to counter to 0 each loop
    (0..size).each do |row|
        live_cells[row] = []
        (0..size).each do |column|
            live_cells[row][column] = 0
        end
    end

    (0..size).each do |row|                            # adding values to live_cells array based on number of neighbors                        
        (0..size).each do |column|
            if grid[row][column] == "0 "
                if row < size                          
                    if grid[row + 1][column] == "0 "    # checking bottom
                        live_cells[row][column] += 1
                    end
                end
                if row > 0
                    if grid[row - 1][column] == "0 "     # checking top
                        live_cells[row][column] += 1
                    end
                end
                if column < size                           # checking right
                    if grid[row][column + 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
                if column > 0                            # checking left
                    if grid[row][column - 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
                if column > 0 && row > 0                 # checking top left
                    if grid[row - 1][column - 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
                if column < size && row < size               # checking bottom right
                    if grid[row + 1][column + 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
                if column < size && row > 0                # checking top right
                    if grid[row - 1][column + 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
                if column > 0 && row < size                # checking bottom left
                    if grid[row + 1][column - 1] == "0 " 
                        live_cells[row][column] += 1
                    end
                end
            end
        end
    end

    # puts "Dead Cells"
    # (0..size).each do |row|                    # printing dead cells array for testing purpose
    #     (0..size).each do |column|
    #         print dead_cells[row][column]
    #     end
    #     puts
    # end
    # puts "Live Cells"
    # (0..size).each do |row|                    # printing for testing purpose
    #     (0..size).each do |column|
    #         print live_cells[row][column]
    #     end
    #     puts
    #  end

    (0..size).each do |row|                    # apply Game of Life rules
        (0..size).each do |column|
            if live_cells[row][column] < 2 || live_cells[row][column] > 3
                grid[row][column] = "* "
            end
            if dead_cells[row][column] == 3
                grid[row][column] = "0 "
            end
        end
    end
    
    puts
    puts "Press enter to quit.".center size * 2     #creating a timer to allow the loop to continue iterating unless the user presses 'enter'
    begin
      Timeout::timeout 1.5 do
        gets.chomp
        looping = false
      end

    rescue Timeout::Error
    end

    gen += 1
end
system("cls")
puts
puts "------- CREDITS -------".center size * 2
puts
puts "ROGUE SQUADRON".center size * 2
puts "(UNDER NEW MANAGEMENT)".center size * 2
puts
puts "Captain Brad Carr\nFirst Mate Sean Lenhart\nEngineer Marc Guimond\nNavigator JR Leonardi"
puts
puts "-----------------------".center size * 2
puts "Thanks for using Conway's Game of Life Simulator."
puts
