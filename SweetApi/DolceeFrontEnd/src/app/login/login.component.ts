import { Component, OnInit } from '@angular/core';
import { UsersService } from "../users/users.service";
import { Router } from '@angular/router';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  email: string;
  password: string;
  isHidden = false;
  currentUser;
  signInForm: FormGroup
  loading = false;
  isOpen = false;
  message;

  constructor(public userService: UsersService, public router: Router, private fb: FormBuilder) { }

  ngOnInit(): void {

    this.signInForm = this.fb.group({
      email: ['', [Validators.required,
      Validators.email]],
      password: ['', [Validators.required,
      Validators.minLength(8)]]
    });


    var result = this.userService.getToken();
    if (result != '') {
      this.isHidden = false;
      this.currentUser = result;

    }
    else if (result == '') {
      this.isHidden = true;
      this.currentUser = null;
    }
  }

  login() {

   
    const user = { email: this.email, password: this.password };
    this.userService.login(this.signInForm.value).subscribe(data => {
      if (data[0]["status"] == 'KO') {
        this.isOpen = true;
        this.message=data[0]["message"];

        return;
      }
      var result = data[0]["token"];
      this.userService.setToken(result);
      
      //this.router.navigateByUrl('/');
      window.location.reload();
     
    });


    
  }

}
