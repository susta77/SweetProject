import { Component, OnInit } from '@angular/core';
import { UsersService } from "../users/users.service";

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  email: string;
  password: string;
  confirmPassword: string;
  passwordError: boolean;
  constructor(public userService: UsersService) { }

  ngOnInit(): void {
  }
  register() {
    const user = { email: this.email, password: this.password };
    //this.userService.register(user).subscribe(data => {
    //  console.log(data);
    //});

    this.userService.register(user).subscribe(data => {
      console.log(data);
      },
      error => {
        console.log(error);
      });

  }
}
