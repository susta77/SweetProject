import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
@Injectable({
  providedIn: 'root'
})

export class ServiceService {

  constructor(private http: HttpClient) { }
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  }
  getData() {

    return this.http.get('http://localhost:44352/vetrina');  //https://localhost:44352/ webapi host url
  }
  getDolci() {
    return this.http.get('http://localhost:44352/dolce/');
  }
  getIngredienti(id) {
    return this.http.get('http://localhost:44352/ricetta/GetIngredienti/id/' + id);
  }
  inserisciDolceVetrina(dolce) {
    return this.http.get('http://localhost:44352/vetrina/inserisciDolceVetrina/dolce/' + dolce);
  }
  EditData() {
    return this.http.post('http://localhost:44352/vetrina', FormData);
  }
  postData(formData) {
    return this.http.post('http://localhost:44352/dolce', FormData);
  }

  putData(id, formData) {
    return this.http.put('/sweetApi/' + id, formData);
  }
  deleteData(id) {
    return this.http.delete('/sweetApi/' + id);
  }

}  
