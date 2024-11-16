<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        // creates the default user in the db if one doesn't exist
        if (User::count() === 0) {
            User::create([
                'name' => 'Admin User',
                'email' => 'test@test.com',
                'password' => Hash::make('123456'),
            ]);
        }
    }
}
