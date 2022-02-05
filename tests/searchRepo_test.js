Feature('searchRepo');

Scenario('自分のリポジトリを検索する', ({ I }) => {
    I.amOnPage('/');
    I.see('Repositories');
    I.click({xpath: '//a[@data-tab-item="repositories"]'});
    I.seeInCurrentUrl('?tab=repositories');
    I.waitForVisible({xpath: '//*[@id="your-repos-filter"]'});
    I.clearField({xpath: '//*[@id="your-repos-filter"]'});
    I.fillField({xpath: '//*[@id="your-repos-filter"]'}, 'codeceptjs_sample2');
    I.pressKey('Enter');
    I.see('codeceptjs_sample2');
});
