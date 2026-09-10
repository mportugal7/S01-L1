package main
import "fmt"

func validarIngresso(setor string, codigo int) bool {
	if setor == "VIP" && codigo == 2026 {
		return true
	} else {
		return false
	}
}
func main() {
	for {
		var setor string
		var codigo int

		fmt.Print("Digite o setor do ingresso: ")
		fmt.Scanln(&setor)

		fmt.Print("Digite o codigo do ingresso: ")
		fmt.Scanln(&codigo)

		valido := validarIngresso(setor, codigo)

		if valido {
			fmt.Println("Acesso liberado a area VIP!")
			break
		} else {
			fmt.Println("Ingresso ou setor invalido. Tente novamente.")
		}
	}
}
