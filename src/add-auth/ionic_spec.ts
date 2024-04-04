import { HostTree, Tree } from '@angular-devkit/schematics';
import { SchematicTestRunner, UnitTestTree } from '@angular-devkit/schematics/testing';
import * as path from 'path';
import packageJson from './ionic-pkg.json';

const collectionPath = path.join(__dirname, '../collection.json');

const defaultOptions: any = {
  issuer: 'https://dev-737523.okta.com/oauth2/default',
  clientId: '0oaifymbuodpH8nAi0h7'
};

describe('OktaDev Schematics: Ionic/Angular', () => {
  it('requires required issuer option', async () => {
    const runner = new SchematicTestRunner('schematics', collectionPath);

    const schematic = runner.runSchematic('add-auth', {}, Tree.empty());
    await expectAsync(schematic).toBeRejectedWithError(/required property 'issuer'/);
  });

  it('works with Okta', async () => {
    const tree = new UnitTestTree(new HostTree);

    tree.create('/package.json', JSON.stringify(packageJson));

    const testOptions: any = {...defaultOptions};
    testOptions.platform = 'capacitor';

    const runner = new SchematicTestRunner('schematics', collectionPath);
    await runner.runSchematic('add-auth', testOptions, tree);

    expect(tree.files.length).toEqual(30);
    expect(tree.files.sort()).toEqual([
      '/package.json',
      '/src/app/app.component.spec.ts',
      '/src/app/app.component.ts',
      '/src/app/app.routes.ts',
      '/src/app/auth/auth-callback/auth-callback.module.ts',
      '/src/app/auth/auth-callback/auth-callback.page.ts',
      '/src/app/auth/auth-guard.service.ts',
      '/src/app/auth/auth-http.service.ts',
      '/src/app/auth/auth.module.ts',
      '/src/app/auth/cap-http.service.ts',
      '/src/app/auth/end-session/end-session.module.ts',
      '/src/app/auth/end-session/end-session.page.ts',
      '/src/app/auth/factories/auth.factory.ts',
      '/src/app/auth/factories/browser.factory.ts',
      '/src/app/auth/factories/http.factory.ts',
      '/src/app/auth/factories/index.ts',
      '/src/app/auth/factories/storage.factory.ts',
      '/src/app/auth/ng-http.service.ts',
      '/src/app/auth/user-info.model.ts',
      '/src/app/login/login.module.ts',
      '/src/app/login/login.page.html',
      '/src/app/login/login.page.scss',
      '/src/app/login/login.page.spec.ts',
      '/src/app/login/login.page.ts',
      '/src/app/tab1/tab1.page.html',
      '/src/app/tab1/tab1.page.spec.ts',
      '/src/app/tab1/tab1.page.ts',
      '/src/environments/environment.prod.ts',
      '/src/environments/environment.ts',
      '/src/main.ts'
    ]);

    const appModule = tree.readContent('/src/app/auth/auth.module.ts');

    expect(appModule).toMatch(/AuthModule/);
    expect(appModule).toMatch(/HttpClient/);

    const env = tree.readContent('/src/environments/environment.ts');
    expect(env).toContain(`client_id: '${defaultOptions.clientId}'`);
    expect(env).toContain(`server_host: '${defaultOptions.issuer}'`);
    expect(env).toContain(`audience: 'api://default'`);

    const pkgJson = tree.readContent('/package.json');
    expect(pkgJson).not.toContain('"cordova":');
    expect(pkgJson).toContain('@capacitor/browser');
    expect(pkgJson).toContain('@capacitor/preferences');
    expect(pkgJson).toContain('capacitor-secure-storage-plugin');
  });

  it('works with Auth0', async () => {
    const tree = new UnitTestTree(new HostTree);

    tree.create('/package.json', JSON.stringify(packageJson));

    const testOptions: any = {...defaultOptions};
    testOptions.issuer = 'https://dev-06bzs1cu.us.auth0.com/';
    testOptions.auth0 = true;

    const runner = new SchematicTestRunner('schematics', collectionPath);
    await runner.runSchematic('add-auth', testOptions, tree);

    expect(tree.files.length).toEqual(30);

    const env = tree.readContent('/src/environments/environment.ts');
    expect(env).toContain(`client_id: '${testOptions.clientId}'`);
    expect(env).toContain(`server_host: '${testOptions.issuer.slice(0, -1)}'`);
    expect(env).toContain(`audience: '${testOptions.issuer}api/v2/'`);
  });

  it('contains Capacitor plugins', async () => {
    const tree = new UnitTestTree(new HostTree);

    tree.create('/package.json', JSON.stringify(packageJson));

    const runner = new SchematicTestRunner('schematics', collectionPath);
    await runner.runSchematic('add-auth', defaultOptions, tree);

    const pkgJson = tree.readContent('/package.json');
    expect(pkgJson).toContain('@capacitor/browser');
    expect(pkgJson).toContain('@capacitor/preferences');
    expect(pkgJson).toContain('capacitor-secure-storage-plugin');
  });
});
