import { JsonPipe } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { AuthActions, AuthService, Browser, IAuthAction } from 'ionic-appauth';
import { IonHeader, IonToolbar, IonTitle, IonContent, IonLabel, IonIcon, IonItem, IonListHeader, IonList, IonCardContent, IonCardHeader, IonCardTitle, IonCard, IonButton, IonImg } from '@ionic/angular/standalone';
import { Subscription } from 'rxjs';
import { environment } from '../../environments/environment';

const { audience } = environment;

@Component({
  selector: 'app-tab1',
  standalone: true,
  imports: [IonHeader, IonToolbar, IonTitle, IonContent, IonLabel, IonIcon, IonItem, IonListHeader, IonList, IonCardContent, IonCardHeader, IonCardTitle, IonCard, IonButton, IonImg, JsonPipe],
  templateUrl: 'tab1.page.html',
  styleUrl: 'tab1.page.scss'
})
export class Tab1Page implements OnInit, OnDestroy {
  user$ = this.auth.user$;
  events$ = this.auth.events$;
  sub!: Subscription;
  action?: IAuthAction;

  constructor(private navCtrl: NavController, private auth: AuthService, private browser: Browser) {
  }

  ngOnInit() {
    this.sub = this.events$.subscribe((action: IAuthAction) => this.onAction(action));
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

  public async signOut() {
    await this.auth.signOut();

    // Auth0 need special handling since end_session_endpoint is not in oidc-configuration
    const issuer = environment.oidcConfig.server_host;
    if (issuer.includes('auth0.com')) {
      const clientId = environment.oidcConfig.client_id;
      const returnTo = encodeURIComponent(environment.oidcConfig.end_session_redirect_url);
      const logoutUrl = `${issuer}/v2/logout?client_id=${clientId}&returnTo=${returnTo}`;
      await this.browser.showWindow(logoutUrl, returnTo);
    }
  }

  public signIn() {
    this.auth.signIn({ audience })
      .catch(error => console.error(`Sign in error: ${error}`));
  }

  public async getUserInfo(): Promise<void> {
    await this.auth.loadUserInfo();
  }

  public async refreshToken(): Promise<void> {
    await this.auth.refreshToken();
  }

  private onAction(action: IAuthAction) {
    if (action.action === AuthActions.LoadTokenFromStorageFailed ||
      action.action === AuthActions.SignInFailed ||
      action.action === AuthActions.SignOutSuccess) {
      delete this.action;
    } else {
      this.action = action;
    }
  }
}
