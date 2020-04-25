$Servers = Import-Csv -Path "D:\Users\akash_si\Desktop\Copy of User.csv"
$allobj = @()
foreach ($Server in $Servers)
{
$a=$Server.DistinguishedName;
$b=$a.IndexOf(",OU")
$c=$a.Substring($b+1)
#$Server.OU=$c
$obj = New-Object psobject
$obj | Add-Member NoteProperty -Name "SamAccountName" -Value $Server.SamAccountName
$obj | Add-Member NoteProperty -Name "DisplayName" -Value $Server.DisplayName
$obj | Add-Member NoteProperty -Name "DistinguishedName" -Value $Server.DistinguishedName
$obj | Add-Member NoteProperty -Name "Output" -Value $c
$obj | Add-Member NoteProperty -Name "Enabled" -Value $Server.Enabled
$obj | Add-Member NoteProperty -Name "LastLogonTimestamp" -Value $Server.LastLogonTimestamp
$obj | Add-Member NoteProperty -Name "PasswordNeverExpires" -Value $Server.PasswordNeverExpires
$obj | Add-Member NoteProperty -Name "whenCreated" -Value $Server.whenCreated
$obj | Add-Member NoteProperty -Name "EucDoNotDelete" -Value $Server.EucDoNotDelete
$obj | Add-Member NoteProperty -Name "EmailAddress" -Value $Server.EmailAddress
$obj | Add-Member NoteProperty -Name "location" -Value $Server.location
$obj | Add-Member NoteProperty -Name "Country" -Value $Server.Country
$obj | Add-Member NoteProperty -Name "Description" -Value $Server.Description
$obj | Add-Member NoteProperty -Name "CanonicalName" -Value $Server.CanonicalName
$obj | Add-Member NoteProperty -Name "Manager" -Value $Server.Manager
$allobj += $obj
}
$allobj | Export-CSV "D:\Users\akash_si\Desktop\Copy of User1.csv" -NoTypeInformation
echo "Success"