import { Component, OnInit } from '@angular/core';

@Component({
  selector: "hello",
  template: `
    <h1>Hello  word !</h1>
  `,
  styles: [
    `
      h1 {
        font-family: Lato;
      }
    `
  ]
})
export class IngredientiComponent implements OnInit {

  constructor() {

  }

  ngOnInit(): void {
  }

}


