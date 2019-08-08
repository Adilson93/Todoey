//
//  AppDelegate.swift
//  Todoey
//
//  Created by Adilson Ebo on 8/6/19.
//  Copyright © 2019 Adilson Ebo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Substitui o ponto para personalização após o lançamento do aplicativo.
        //print("didFinishLaunchingWithOptions")
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // Enviado quando o aplicativo está prestes a se mover do estado ativo para o inativo. Isso pode ocorrer para certos tipos de interrupções temporárias (como uma chamada telefônica recebida ou uma mensagem SMS) ou quando o usuário sai do aplicativo e começa a transição para o estado de segundo plano.
        // Use este método para pausar tarefas em andamento, desabilitar timers e invalidar retornos de chamada de renderização de gráficos. Os jogos devem usar esse método para pausar o jogo.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // Use este método para liberar recursos compartilhados, salvar dados do usuário, invalidar cronômetros e armazenar informações de estado de aplicativo suficientes para restaurar seu aplicativo ao estado atual, caso seja finalizado posteriormente.
        // Se seu aplicativo suportar execução em segundo plano, esse método será chamado em vez de applicationWillTerminate: quando o usuário sair.
        
          print("applicationDidEnterBackground")
        
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
        
        // Chamado como parte da transição do plano de fundo para o estado ativo; aqui você pode desfazer muitas das alterações feitas ao entrar no plano de fundo.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        // Reinicie todas as tarefas que foram pausadas (ou ainda não iniciadas) enquanto o aplicativo estava inativo. Se o aplicativo estava anteriormente em segundo plano, opcionalmente atualize a interface do usuário.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Chamado quando o aplicativo está prestes a terminar. Salvar dados, se apropriado. Veja também applicationDidEnterBackground :.
        
          print("applicationWillTerminate")
    }


}

