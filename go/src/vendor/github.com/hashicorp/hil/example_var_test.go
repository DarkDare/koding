package hil_test

import (
	"fmt"
	"log"

	"github.com/hashicorp/hil"
	"github.com/hashicorp/hil/ast"
)

func Example_variables() {
	input := "${var.test} - ${6 + 2}"

	tree, err := hil.Parse(input)
	if err != nil {
		log.Fatal(err)
	}

	config := &hil.EvalConfig{
		GlobalScope: &ast.BasicScope{
			VarMap: map[string]ast.Variable{
				"var.test": ast.Variable{
					Type:  ast.TypeString,
					Value: "TEST STRING",
				},
			},
		},
	}

	value, valueType, err := hil.Eval(tree, config)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("Type: %s\n", valueType)
	fmt.Printf("Value: %s\n", value)
	// Output:
	// Type: TypeString
	// Value: TEST STRING - 8
}
