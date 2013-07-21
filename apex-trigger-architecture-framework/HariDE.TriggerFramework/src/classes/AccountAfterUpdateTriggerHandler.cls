public class AccountAfterUpdateTriggerHandler extends TriggerHandlerBase {
	public override void mainEntry(TriggerParameters tp) {
		process((List<Account>)tp.newList);
	}
	
	private static void process(List<Account> listNewAccounts) {
		List<Account> acctsToBeUpdated = new List<Account>();
		for(Account acct : listNewAccounts) {
			Account newAccount = new Account();
			newAccount.Id = acct.Id;
			newAccount.Name = acct.Name + ' updated.';
			acctsToBeUpdated.add(newAccount);
		}
		update acctsToBeUpdated;
	}
	
	public override void inProgressEntry(TriggerParameters tp) {
		System.debug('This is an example for reentrant code...');
	}
}