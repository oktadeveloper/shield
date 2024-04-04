import { Routes } from '@angular/router';

export const routes: Routes = [
  { path: '', loadChildren: () => import('./tabs/tabs.routes').then((m) => m.routes) },
  { path: 'callback', loadChildren: () => import('./auth/auth-callback/auth-callback.module').then(m => m.AuthCallbackPageModule) },
  { path: 'logout', loadChildren: () => import('./auth/end-session/end-session.module').then(m => m.EndSessionPageModule) },
  { path: 'login', loadChildren: () => import('./login/login.module').then(m => m.LoginPageModule) },
];
