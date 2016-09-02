package main

import (
"./ann"
"fmt"
)

func main() {
	fmt.Println("-- SOM Food Test")

	som := ann.NewSOM(12, 12, 3, 25)
	data := [][]float64{}
	result := [][]float64{}
	test := [][]float64{}


	// training patterns
	//Apples1
	result = append(result, []float64{1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.01532567049808430,0.12407991587802300,0.00123456790123457})
	//Avocado
	result = append(result, []float64{0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.07279693486590040,0.01997896950578340,0.24074074074074100})
	//Bananas
	result = append(result, []float64{0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.04597701149425290,0.24395373291272300,0.00370370370370370})
	//Beef_Steak
	result = append(result, []float64{0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.80076628352490400,0.00000000000000000,0.09753086419753090})
	//Big_Mac
	result = append(result, []float64{0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.49808429118773900,0.19978969505783400,0.13580246913580200})
	//Brazil_Nuts
	result = append(result, []float64{0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.59386973180076600,0.03049421661409040,0.84320987654321000})
	//Bread
	result = append(result, []float64{0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.40229885057471300,0.38906414300736100,0.03950617283950620})
	//Butter
	result = append(result, []float64{0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.03831417624521070,0.00000000000000000,1.00000000000000000})
	//Cheese
	result = append(result, []float64{0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.95785440613026800,0.00105152471083070,0.42469135802469100})
	//Cheesecake
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.24521072796934900,0.29652996845425900,0.28024691358024700})
	//Cookies
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.21839080459770100,0.61724500525762400,0.36172839506172800})
	//Cornflakes
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.26819923371647500,0.88328075709779200,0.01111111111111110})
	//Eggs
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.47892720306513400,0.00000000000000000,0.13333333333333300})
	//Fried_Chicken
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.65134099616858200,0.07360672975814930,0.24691358024691400})
	//Fries
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.11494252873563200,0.37854889589905400,0.16049382716049400})
	//Hot_Chocolate
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.14559386973180100,0.20399579390115700,0.12592592592592600})
	//Pepperoni
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0})
	data = append(data, []float64{0.80076628352490400,0.05362776025236590,0.47283950617283900})
	//Pizza
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0})
	data = append(data, []float64{0.47892720306513400,0.31545741324921100,0.13580246913580200})
	//Pork_Pie
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0})
	data = append(data, []float64{0.38697318007662800,0.28706624605678200,0.29876543209876500})
	//Potatoes
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0})
	data = append(data, []float64{0.06513409961685820,0.16929547844374300,0.00370370370370370})
	//Rice
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0})
	data = append(data, []float64{0.26436781609195400,0.77812828601472100,0.03456790123456790})
	//Roast_Chicken
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0})
	data = append(data, []float64{1.00000000000000000,0.00315457413249211,0.07160493827160490})
	//Sugar
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0})
	data = append(data, []float64{0.00000000000000000,1.00000000000000000,0.00000000000000000})
	//Tuna_Steak
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0})
	data = append(data, []float64{0.98084291187739500,0.00000000000000000,0.00617283950617284})
	//Water
	result = append(result, []float64{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1})
	data = append(data, []float64{0.00000000000000000,0.00000000000000000,0.00000000000000000})
	
    // test data
	test = append(test,[]float64{0.26436781609195400, 0.20399579390115700, 0.03950617283950620} ); // rice, chocolate, bread
	test = append(test,[]float64{0.47892720306513400, 0.31545741324921100, 0.00617283950617284} ); // pizza, pizza, Tuna_Steak
	test = append(test,[]float64{0.80076628352490400, 0.61724500525762400,0.36172839506172800} ); // peperoni, cookie, cookie

		
	fmt.Println("\ntraining: ",len(data))
	som.Train(5000, data, result)

	// test with training data
	printPredic(data[0], som.PredictInt(data[0]))
	printPredic(data[9], som.PredictInt(data[9]))
	printPredic(data[24], som.PredictInt(data[24]))


	fmt.Println("\nrunning predictions:")
	printPredic(test[0], som.PredictInt(test[0]))
	printPredic(test[1], som.PredictInt(test[1]))
	printPredic(test[2], som.PredictInt(test[2]))

}

func printPredic(data []float64, result []int) {
	//result names
	 names := []string{"Apples","Avocado","Bananas","Beef Steak","Big Mac","Brazil Nuts","Bread","Butter","Cheese","Cheesecake","Cookies","Cornflakes","Eggs","Fried Chicken","Fries","Hot Chocolate","Pepperoni","Pizza","Pork Pie","Potatoes","Rice","Roast Chicken","Sugar","Tuna Steak","Water"}
	fmt.Println(data, result)

	for i := 0; i < len(result); i++ {
		if result[i] > 0 {
			fmt.Print("= (", result[i] ,") ",names[i], " ")

		}
	}
	fmt.Println("\n")

}