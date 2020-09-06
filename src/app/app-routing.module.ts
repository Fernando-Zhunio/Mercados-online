import { NgModule } from '@angular/core';
import { PreloadAllModules, RouterModule, Routes } from '@angular/router';
import { ClientesGuard } from './Guards/clientes.guard';
import { LoginAndRegisterGuard } from './Guards/login-and-register.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'folder/Inbox',
    pathMatch: 'full'
  },
  {
    path: 'folder/:id',
    loadChildren: () => import('./folder/folder.module').then( m => m.FolderPageModule)
  },
  {
    path: 'login',
    canActivate:[LoginAndRegisterGuard],
    loadChildren: () => import('./login/login-page/login-page.module').then( m => m.LoginPagePageModule)
  },
  {
    path: 'register',
    canActivate:[LoginAndRegisterGuard],
    loadChildren: () => import('./register/register-page/register-page.module').then( m => m.RegisterPagePageModule)
  },
  {
    path: 'cliente',
    canActivate:[ClientesGuard],
    loadChildren: () => import('./Page/cliente/cliente.module').then( m => m.ClientePageModule)
  },
  {
    path: 'transportista',
    canActivate:[ClientesGuard],
    loadChildren: () => import('./Page/transportista/transportista.module').then( m => m.TransportistaPageModule)
  },
  {
    path: 'vendedor',
    canActivate:[ClientesGuard],
    loadChildren: () => import('./Page/vendedor/vendedor.module').then( m => m.VendedorPageModule)
  },
  {
    path: 'tendero',
    loadChildren: () => import('./Page/tendero/tendero.module').then( m => m.TenderoPageModule)
  }
];

@NgModule({
  imports: [
    RouterModule.forRoot(routes, { preloadingStrategy: PreloadAllModules })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
