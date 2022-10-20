#Cette classe permet de mettre en place le jeu et de le lancer avec des valeurs de base
class Game

  def initialize
    @board = Board.new
    @current_player = ""
    @winner = false
    @turn = 0
  end
#Méthode permettant de lancer le jeu et de démarrer la partie et déterminer l'issue de la partie. On crée de nouveaux joueurs avec des noms récupérés de la méthode 'get_names'.
  def start_game
    names = get_names
    @player1 = Player.new(names[0], :X, @board)
    @player2 = Player.new(names[1], :O, @board)
    @current_player = @player1
    @board.show_board
    turn until @winner || @turn == 9
    if @winner
      puts "BRAVO!!! #{@winner.name} A GAGNÉ!"
    else
      puts "rejouez!"
    end
  end

 #le jouer peut entrer un nombre compris entre 1 et 9, si le nombre n'est pas compris dans cet intervalle un message s'affiche demandant de redonner une valeur.
  def turn
    puts "Au tour de #{@current_player.name}. Choisis ta case (1-9): "
    choice = gets.chomp.to_i
    if choice > 9 || choice < 1
      puts "Attention: le nombre choisi doit être en 1 et 9"
    elsif @current_player.move(choice) != false
      @winner = @current_player if @current_player.winner?
      @turn += 1
      switch_player
    end
  end
# Méthode permettant de mettre en place les changement de joueur
  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end


  def get_names
    system 'clear'
    print "Un premier joueur dessine son symbole sur une case.
  Puis c'est au tour de l'autre joueur de dessiner son symbole sur une case vide.
  Le but du jeu est de réussir à aligner ses trois symboles, on remporte alors la partie.\n\n"
    puts "Nom du Joueur qui aura pour symbole X: "
    name1 = gets.chomp
    puts "Nom du Joueur qui aura pour symbole O: "
    name2 = gets.chomp
    [name1, name2]
  end

end

