import { BrowserModule } from '@angular/platform-browser';
import { Component, NgModule } from '@angular/core';
import { AppComponent } from './app.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { ServiceService } from './service.service';
import { OverlayModule } from "@angular/cdk/overlay";
import { IngredientiComponent } from './ingredienti/ingredienti.component';
import { RouterModule, Routes } from '@angular/router';
import { HeaderComponent } from './Shared/header/header.component';
import { FooterComponent } from './Shared/footer/footer.component';
import { VetrinaComponent } from './vetrina/vetrina.component';
import { BackofficeComponent } from './backoffice/backoffice.component';
import { RegisterComponent } from './register/register.component';
import { LoginComponent } from './login/login.component';
import { CookieService } from 'ngx-cookie-service';

const router: Routes = [
  {
    path: 'bakoffice',
    component: BackofficeComponent,
  },
  {
    path: 'vetrina',
    component: VetrinaComponent,
  },
  {
    path: 'login',
    component: LoginComponent
  },
   {
    path: 'register',
    component: RegisterComponent
  }
];

@NgModule({
  declarations: [
    AppComponent,
    IngredientiComponent,
    HeaderComponent,
    FooterComponent,
    VetrinaComponent,
    BackofficeComponent,
    RegisterComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,
    OverlayModule
    ,
    RouterModule.forRoot(router)

  ],
  providers: [ServiceService,CookieService],
  bootstrap: [AppComponent],

})
export class AppModule { }
