//
//  DetailViewController.m
//  RecipeAppDo1
//
//  Created by Warren Goh on 4/30/15.
//  Copyright (c) 2015 WG. All rights reserved.
//

#import "DetailViewController.h"
#import "RARecipes.h"
#import "RecipeViewController.h"
#import "RecipesTableDataSource.h"

CGFloat heightHolder;

@interface DetailViewController ()


@property (nonatomic) UIScrollView *scrollView;

@end
CGFloat topRow = 25.0;
CGFloat margin = 15.0;


@implementation DetailViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView = [UIScrollView new];
    self.scrollView.frame = CGRectMake(0, topRow, self.view.frame.size.width, self.view.frame.size.height);
    [self.view addSubview:self.scrollView];
    CGSize contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
    self.scrollView.contentSize = contentSize;
    

        
    UILabel *theDescription = [[UILabel alloc] initWithFrame:CGRectMake(CGRectFromString([RARecipes descriptionAtIndex:i])),20.0, CGFloat width, <#CGFloat height#>)
        
        theDescription.text = [RARecipes titleAtIndex:i];
        heightHolder += theDescription.frame.size.height;
        
        for (int i = 0; i < [RARecipes ingredientCountAtIndex:i]; i++) {
            
            
            
        }

        UILabel *count = [[UILabel alloc] initWithFrame:CGRectMake(margin, top, 30, 20)];
        count.font = [UIFont boldSystemFontOfSize:17];
        count.text = [NSString stringWithFormat:@"%d", i + 1];
        [scrollView addSubview:count];
        
        UILabel *direction = [[UILabel alloc] initWithFrame:CGRectMake(margin + 30, top, (self.view.frame.size.width - 2 * margin - 40), height)];
        direction.numberOfLines = 0;
        direction.text = [RARecipes directionsAtIndex:self.recipeIndex][i];
        
        [scrollView addSubview:direction];
        
        top += (height + margin);
      for (int i = 0; i < [RARecipes count]; i++) {
    }
    
    
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
