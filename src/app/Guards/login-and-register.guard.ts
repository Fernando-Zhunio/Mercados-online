import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree } from '@angular/router';
import { Observable } from 'rxjs';
import { StorageService } from '../Servicios/storage.service';

@Injectable({
  providedIn: 'root'
})
export class LoginAndRegisterGuard implements CanActivate {
  constructor(private storageSvc: StorageService){}
  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {
    // return true;
    if (this.storageSvc.isAuthenticated()) {
      // logged in so return true
      return false;
    }
    // not logged in so redirect to login page
    // this.route.navigate(['/login']);
    return true;
  }
  
}
