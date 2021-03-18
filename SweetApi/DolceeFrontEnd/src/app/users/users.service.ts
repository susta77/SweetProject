import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { Observable } from 'rxjs';
//import { Observable } from "rxjs/Observable";
import { CookieService } from "ngx-cookie-service";

@Injectable({
  providedIn: "root"
})
export class UsersService {
 
  constructor(private http: HttpClient, private cookies: CookieService) { }

  login(Auth): Observable<any> {
    /*return this.http.post("http://localhost:44352/auth/getToken",Auth);*/
    //Funzionante ma ha problemi con la response
   var data = this.http.post('http://localhost:44352/auth', Auth);

   //  var data = this.http.post<any>(`http://localhost:44352/auth/`, Auth);
 
    return data;
  }
  register(Auth): Observable<any> {
    //return this.http.post("http://localhost:44352/auth/getToken", Auth);
    return this.http.get("http://localhost:44352/auth", Auth);
  }

  setToken(token) {
    this.cookies.set("token", token);
    (
      error => {
        console.log(error);
      });

  }
  getToken() {
    var result = this.cookies.get("token");
    return result;
  }

  logOut() {
    this.cookies.delete("token");
    window.location.reload();
  }



}
