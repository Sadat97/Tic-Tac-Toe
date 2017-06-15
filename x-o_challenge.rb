#x-o challenge


$xo = [1,2,3,4,5,6,7,8,9] #array of places
$turn = 1 #determines the turn of a player
puts "#{$xo[0]} | #{$xo[1]} | #{$xo[2]}", #The Drawing of the Board
     "---------",
     "#{$xo[3]} | #{$xo[4]} | #{$xo[5]}",
     "---------",
     "#{$xo[6]} | #{$xo[7]} | #{$xo[8]}"

WINNING_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]
# all winning probabilities

def game(num) #The main Game Function
  if $turn == 1
    $xo[num - 1]='X'
    $turn = 2
  else
    $xo[num - 1]='O'
    $turn = 1
  end

  puts "#{$xo[0]} | #{$xo[1]} | #{$xo[2]}", #The Drawing of the Board
       "---------",
       "#{$xo[3]} | #{$xo[4]} | #{$xo[5]}",
       "---------",
       "#{$xo[6]} | #{$xo[7]} | #{$xo[8]}"
  print "\n"

  WINNING_COMBINATIONS.each do |x| #checkes if any player achieves the probability
    return 1  if $xo[x[0]] == 'X' && $xo[x[1]] == 'X' && $xo[x[2]] == 'X' #Player 1 wins
    return 2  if $xo[x[0]] == 'O' && $xo[x[1]] == 'O' && $xo[x[2]] == 'O' #Player 2 Wins
  end
   return 0 #No one Wins
end

for i in 0..8 #loops for 9 turns
  puts "Player #{$turn} , Please choose a place to play"
  choice = gets.chomp.to_i #The place the player choosed

  while  $xo[choice -1] == 'X' || $xo[choice -1] == 'O' || choice < 1 || choice > 9 do #to make the player choose  an empty place
    puts "Please choose another place , as this is taken"
    choice = gets.chomp.to_i
  end

  $stat = game(choice) #gets the stat of the game

  if $stat == 1 || $stat == 2 #Checkes if anyone wins the game
    puts "Player #{$stat} wins !"
    break
   end
end

puts "It's a Draw!" if $stat == 0  #checks if there was a draw