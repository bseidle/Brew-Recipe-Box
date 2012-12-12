using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BrewRecipeBox.Models
{
    class UserSummary : User
    {
        public List<UserSetting>  UserSettings { get; set; }
    }
}
