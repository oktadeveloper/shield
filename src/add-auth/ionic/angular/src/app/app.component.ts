import { Component } from '@angular/core';
import { Platform } from '@ionic/angular';
import { IonApp, IonRouterOutlet } from '@ionic/angular/standalone';
import { SplashScreen } from '@capacitor/splash-screen';
import { AuthService } from 'ionic-appauth';

@Component({
  selector: 'app-root',
  standalone: true,
  templateUrl: 'app.component.html',
  imports: [IonApp, IonRouterOutlet]
})
export class AppComponent {

  constructor(
    private platform: Platform,
    private auth: AuthService
  ) {
    this.initializeApp();
  }

  initializeApp() {
    this.platform.ready().then(async () => {
      await this.auth.init();
      if (this.platform.is('mobile') && !this.platform.is('mobileweb')) {
        await SplashScreen.hide();
      }
    });
  }
}
