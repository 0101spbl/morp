class Board
  attr_accessor :cells
#Permet de mettre à jour le tableau en fonction des inputs du joueur tout en garantissant que la cellule soit vide
  def initialize
    @cells = [
    "1", "2", "3",
    "4", "5", "6",
    "7", "8", "9"
    ]
  end
#Affichage du corps du tableau (valeurs de base + lignes verticales et horizontales)
  def update_cell(number, mark)
    if cell_free?(number)
      self.cells[number - 1] = mark.to_s
      show_board
    else
      puts "Cette case a déjà été jouée."
      return false
    end
  end

#remplace les cellules par le signe du joueur si elles
#sont vides, sinon la cellule n'est pas complétée
  
  def show_board
    hline = "\u2502"
    vline = "\u2500"
    cross = "\u253C"
    row1 = " " + self.cells[0..2].join(" #{hline} ")
    row2 = " " + self.cells[3..5].join(" #{hline} ")
    row3 = " " + self.cells[6..8].join(" #{hline} ")
    separator = vline * 3 + cross + vline * 3 + cross + vline * 3
    system("clear")
    puts row1
    puts separator
    puts row2
    puts separator
    puts row3
  end


#Permet de remplacer les cellules par le signe du joueur en checkant si elles sont vides, sinon la cellule n'est pas complétée
  def cell_free?(number)
    cell = self.cells[number - 1]
    if cell == "X" ||  cell == "O"
      false
    else
      true
    end
  end

end
