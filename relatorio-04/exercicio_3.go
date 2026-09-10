package main
import "fmt"

func gerarEscalaPlantao(n int) {
	fmt.Println("--- Escala de Plantao Tecnico ---")

	for i := 1; i <= n; i++ {
		dia := 1 + (i-1)*4
		fmt.Printf("Plantao %d: Dia %d do mes\n", i, dia)
	}
}
func main() {
	var n int

	fmt.Print("Digite a quantidade de plantoes necessarios: ")
	fmt.Scanln(&n)

	gerarEscalaPlantao(n)
}
