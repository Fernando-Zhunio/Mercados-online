import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthServiceService } from '../Servicios/auth-service.service';
import { StorageService } from '../Servicios/storage.service';

@Injectable({
  providedIn: 'root'
})
export class ClientesGuard implements CanActivate {
  constructor(private route:Router,private storageService:StorageService){}
  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    // return this.svcLogin.login()  
    // return true;
    if (this.storageService.isAuthenticated()) {
      // logged in so return true
      return true;
    }
    // not logged in so redirect to login page
    this.route.navigate(['/login']);
    return false;
  }
  
}
